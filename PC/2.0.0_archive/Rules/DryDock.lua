-- Feature Catalogue Version: 2.0.0 (2025/10/25)
-- Modified for S-131 2.0.0 by IIC 20250107

-- Dry dock main entry point.
function DryDock(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Point then
		viewingGroup = 32400
		featurePortrayal:AddInstructions('ViewingGroup:32400;DrawingPriority:12;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:131SYMBL3S')
		
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 32400
		featurePortrayal:AddInstructions('ViewingGroup:32400;DrawingPriority:12;DisplayPlane:UnderRADAR')
    featurePortrayal:SimpleLineStyle('solid',0.64,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
