-- Feature Catalogue Version: 1.0.0 (2022/11/28)
-- Modified for S-131 2.0.0 by IIC 20250107

-- LockBasinPart main entry point.

function LockBasinPart(feature, featurePortrayal, contextParameters)
	local viewingGroup = 36020

	featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup .. ';DrawingPriority:18')
	
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and Paper chart use same symbolization
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('DisplayPlane:UnderRadar')
		end
		
			featurePortrayal:AddInstructions('PointInstruction:131SYMBL3S')
		

	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('DisplayPlane:UnderRadar')
		featurePortrayal:SimpleLineStyle('solid',0.32,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
