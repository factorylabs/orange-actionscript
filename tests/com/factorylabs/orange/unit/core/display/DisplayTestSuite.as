
package com.factorylabs.orange.unit.core.display
{
  import com.factorylabs.orange.unit.core.display.fills.BitmapFillTests;
  import com.factorylabs.orange.unit.core.display.fills.GradientFillTests;
  import com.factorylabs.orange.unit.core.display.fills.GradientStrokeTests;
  import com.factorylabs.orange.unit.core.display.fills.SolidFillTests;
  import com.factorylabs.orange.unit.core.display.fills.SolidStrokeTests;
  import com.factorylabs.orange.unit.core.display.graphics.FCircleTests;
  import com.factorylabs.orange.unit.core.display.graphics.FDashedLineTests;
  import com.factorylabs.orange.unit.core.display.graphics.FEllipseTests;
  import com.factorylabs.orange.unit.core.display.graphics.FPolyFromPointsTests;
  import com.factorylabs.orange.unit.core.display.graphics.FPolygonTests;
  import com.factorylabs.orange.unit.core.display.graphics.FRectCorneredComplexTests;
  import com.factorylabs.orange.unit.core.display.graphics.FRectCorneredTests;
  import com.factorylabs.orange.unit.core.display.graphics.FRectRoundComplexTests;
  import com.factorylabs.orange.unit.core.display.graphics.FRectRoundTests;
  import com.factorylabs.orange.unit.core.display.graphics.FRectangleTests;
  import com.factorylabs.orange.unit.core.display.graphics.FSquareTests;
  import com.factorylabs.orange.unit.core.display.graphics.FWedgeTests;
  import com.factorylabs.orange.unit.core.display.graphics.GraphicTests;
  import com.factorylabs.orange.unit.core.display.stage.StageAlignmentTests;
  import com.factorylabs.orange.unit.core.display.stage.StageBackgroundTests;
  import com.factorylabs.orange.unit.core.display.timeline.TimelineWatcherTests;

  /**
   * Suite of test cases for the display package.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Nov 27, 2009
   */
  [Suite]
  public class DisplayTestSuite
  {
    public var theFBitmapTests          :FBitmapTests;
    public var theFBitmapSnapshotTests      :FBitmapSnapshotTests;
    public var theFBitmapTextTests        :FBitmapTextTests;
    public var theFButtonTests          :FButtonTests;
    public var theFDisplayObjectPropertiesTests :FDisplayObjectPropertiesTests;
    public var theFMovieClipTests       :FMovieClipTests;
    public var theFShapeTests         :FShapeTests;
    public var theFSpriteTests          :FSpriteTests;
    public var theFTextFieldTests       :FTextFieldTests;

    public var theBitmapFillTests       :BitmapFillTests;
    public var theGradientFillTests       :GradientFillTests;
    public var theGradientStrokeTests     :GradientStrokeTests;
    public var theSolidFillTests        :SolidFillTests;
    public var theSolidStrokeTests        :SolidStrokeTests;

    public var theGraphicTests          :GraphicTests;
    public var theFCircleTests          :FCircleTests;
    public var theFDashedLineTests        :FDashedLineTests;
    public var theFEllipseTests         :FEllipseTests;
    public var theFPolyFromPointsTests      :FPolyFromPointsTests;
    public var theFPolygonTests         :FPolygonTests;
    public var theFRectangleTests       :FRectangleTests;
    public var theFRectCorneredTests      :FRectCorneredTests;
    public var theFRectCorneredComplexTests   :FRectCorneredComplexTests;
    public var theFRectRoundTests       :FRectRoundTests;
    public var theFRectRoundComplexTests    :FRectRoundComplexTests;
    public var theFSquareTests          :FSquareTests;
    public var theFWedgeTests         :FWedgeTests;

    public var theStageAlignmentTests     :StageAlignmentTests;
    public var theStageBackgroundTests      :StageBackgroundTests;

    public var theTimelineWatcherTests      :TimelineWatcherTests;
  }
}

