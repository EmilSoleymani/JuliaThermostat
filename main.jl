using Test
using QML
using Qt5QuickControls_jll
using Qt5QuickControls2_jll
using Observables

@enum HeatSelectState Heating Cooling Auto

# State variables
currentSystemTemp = Observable(65)
targetTemp = Observable(70)
systemStatusMessage = Observable("Heating...")
systemState = Observable(Int(Heating))

# Update targetTemp Observable. Update Sysem status message
function setTargetTemp(temp)
    global targetTemp[] = temp
    checkSystemStatus()
end

# Update systemState Observable. Update Sysem status message
function setSystemState(state) 
    systemState[] = state
    checkSystemStatus()
end

# Checks system status and updates systemStatusMessage
function checkSystemStatus()
    if currentSystemTemp[] < targetTemp[] && systemState[] == Int(Heating)
        systemStatusMessage[] = "Heating..."
    elseif currentSystemTemp[] > targetTemp[] && systemState[] == Int(Cooling)
        systemStatusMessage[] = "Cooling..."
    elseif systemState[] == Int(Auto)
        if currentSystemTemp[] < targetTemp[]
            systemStatusMessage[] = "Heating..."
        elseif currentSystemTemp[] > targetTemp[]
            systemStatusMessage[] = "Cooling..."
        else
            systemStatusMessage[] = "Holding..."
        end
    else 
        systemStatusMessage[] = "Holding..."
    end
end

@qmlfunction setTargetTemp setSystemState

# Load QML File
loadqml("main.qml", 
        guiproperties=JuliaPropertyMap("currentSystemTemperature" => currentSystemTemp, "targetTemp" => targetTemp, "systemState" => systemState, "systemStatusMessage" => systemStatusMessage))

# Run the application
exec()
