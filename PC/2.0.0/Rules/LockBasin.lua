-- Feature Catalogue Version: 2.0.0
-- Developed for S-131 by IIC
-- require 'S101AttributeSupport'

-- Lock basin main entry point.
function LockBasin(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 31020
		featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:9;DisplayPlane:UnderRADAR;ColorFill:DEPVS')
		featurePortrayal:SimpleLineStyle('solid',0.32,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	elseif feature.PrimitiveType == PrimitiveType.Point then
		viewingGroup = 31020
		featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:9;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:131SYMBL3')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	local featureName = GetFeatureName(feature, contextParameters)
	if featureName or HasHorizontalClearance(feature) then
		featurePortrayal:AddInstructions('LocalOffset:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontColor:CHBLK')
		if featureName then
			featurePortrayal:AddTextInstruction(EncodeString(featureName), 26, 24, viewingGroup, 9)
			PortrayClearances(feature, featurePortrayal, contextParameters, viewingGroup, 0, -3.51)
		else
			PortrayClearances(feature, featurePortrayal, contextParameters, viewingGroup, 0, 0)
		end
	end

	return viewingGroup
end
