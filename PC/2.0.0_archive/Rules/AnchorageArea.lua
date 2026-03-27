-- Feature Catalogue Version: 2.0.0 (2025/10/25)
-- Modified for S-131 2.0.0 by IIC 20250107

-- Anchorage area main entry point.
function AnchorageArea(feature, featurePortrayal, contextParameters)
    local viewingGroup

    if feature.PrimitiveType == PrimitiveType.Point then
        viewingGroup = 32440
        if contextParameters.RadarOverlay then
            featurePortrayal:AddInstructions(
                'ViewingGroup:32440;DrawingPriority:18;DisplayPlane:OverRADAR'
            )
        else
            featurePortrayal:AddInstructions(
                'ViewingGroup:32440;DrawingPriority:18;DisplayPlane:UnderRADAR'
            )
        end

        featurePortrayal:AddInstructions('PointInstruction:131SYMBL3S')

        if feature.featureName
           and feature.featureName[1]
           and feature.featureName[1].name then
            featurePortrayal:AddInstructions('LocalOffset:-3.51,-7.02;FontSize:10')
            featurePortrayal:AddTextInstruction(
                EncodeString(GetFeatureName(feature, contextParameters)),
                26, 24, 32440, 18
            )
        end

    elseif feature.PrimitiveType == PrimitiveType.Surface then
        viewingGroup = 32440
        featurePortrayal:AddInstructions(
            'ViewingGroup:32440;DrawingPriority:9;DisplayPlane:UnderRADAR'
        )
        featurePortrayal:AddInstructions('PointInstruction:131INFRM')
        featurePortrayal:SimpleLineStyle('dash', 0.64, 'CHGRD')
        featurePortrayal:AddInstructions('LineInstruction:_simple_')

        if feature.featureName
           and feature.featureName[1]
           and feature.featureName[1].name then
            featurePortrayal:AddInstructions(
                'LocalOffset:-3.51,-7.02;TextAlignHorizontal:End;FontSize:10'
            )
            featurePortrayal:AddTextInstruction(
                EncodeString(GetFeatureName(feature, contextParameters)),
                26, 24, 32440, 9
            )
        end
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    return viewingGroup
end