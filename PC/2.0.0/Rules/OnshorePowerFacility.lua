-- Feature Catalogue Version: 1.0.0 (2022/11/28)
-- Modified for S-131 2.0.0 by IIC 20250107

-- OnshorePowerFacility main entry point.
function OnshorePowerFacility(feature, featurePortrayal, contextParameters)
	local viewingGroup = 32400

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart uses same symbolization
		featurePortrayal:AddInstructions('AlertReference:NavHazard;ViewingGroup:' .. viewingGroup .. ';DrawingPriority:18')
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('DisplayPlane:UnderRadar')
		end
		featurePortrayal:AddInstructions('PointInstruction:131SYMBL3S')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
