-- Feature Catalogue Version: 1.0.0 (2022/12/31)
-- Modified for S-131 2.0.0 by IIC 20250107

-- Outer Limit main entry point.
function OuterLimit(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries then
		viewingGroup = 36050
		featurePortrayal:AddInstructions('ViewingGroup:36050;DrawingPriority:6;DisplayPlane:UnderRADAR')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
        viewingGroup = 36050
        featurePortrayal:AddInstructions(
            'ViewingGroup:36050;DrawingPriority:6;DisplayPlane:UnderRADAR'
        )
        featurePortrayal:AddInstructions('PointInstruction:131INFRM')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
        viewingGroup = 36050
        featurePortrayal:AddInstructions(
            'ViewingGroup:36050;DrawingPriority:6;DisplayPlane:UnderRADAR'
        )
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
