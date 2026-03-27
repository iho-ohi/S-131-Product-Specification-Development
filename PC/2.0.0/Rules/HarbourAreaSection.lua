-- Feature Catalogue Version: 2.0.0
-- Developed for S-131 by IIC

-- Harbour area section main entry point.
function HarbourAreaSection(feature, featurePortrayal, contextParameters)
    local viewingGroup = 36020

    if feature.PrimitiveType == PrimitiveType.Point then
       featurePortrayal:AddInstructions(
                    'ViewingGroup:36020;DrawingPriority:12;DisplayPlane:UnderRADAR'
                )
            featurePortrayal:AddInstructions('PointInstruction:131SYMBL3S')

    elseif feature.PrimitiveType == PrimitiveType.Surface then
        viewingGroup = 36020
        featurePortrayal:AddInstructions(
            'ViewingGroup:36020;DrawingPriority:9;DisplayPlane:UnderRADAR'
        )
        featurePortrayal:AddInstructions('PointInstruction:131INFRM')
        featurePortrayal:SimpleLineStyle('dash', 0.64, 'CHGRD')
        featurePortrayal:AddInstructions('LineInstruction:_simple_')

    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    return viewingGroup
end

