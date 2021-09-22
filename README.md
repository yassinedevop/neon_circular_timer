# neon_circular_timer

Make a timer application with a fancy neon effect and beautiful UI

`v0.0.3 and above` now the timer has also a neumorphic border

### Preview of example

![example preview](https://media.giphy.com/media/rM45TxvYlQjvdJ7AG1/giphy.gif?cid=790b7611c217e41209a0375380b68c8b1b72bf91151b56f0&rid=giphy.gif "example Preview")

### Usage


Use `neumorphicEffect` to show or hide the neumorphic border

Use `isTimerTextShown` to show or hide the text

With `neumorphicEffect` is `true` and `isTimerTextShown` is `false` 

<pre>

  NeonCircularTimer(
                width: 200,
                    duration: 20,
                    controller : your_controller
                    isTimerTextShown: false,
                    neumorphicEffect: true,
                    innerFillGradient: LinearGradient(colors: [
                      Colors.greenAccent.shade200,
                      Colors.blueAccent.shade400
                    ]),
                    neonGradient: LinearGradient(colors: [
                      Colors.greenAccent.shade200,
                      Colors.blueAccent.shade400
                    ]),
                   ),
</pre>

![neum no text](https://media.giphy.com/media/q5KiSQq0k2lWCtxOt5/giphy.gif?cid=790b76116afb344ed52321d56e53f96b7e911a2274741577&rid=giphy.gif "with neumorphic but no text")

#### with `neumorphicEffect` is `false` and `isTimerTextShown` is `false` 

<pre>
  NeonCircularTimer(
                width: 200,
                    duration: 20,
                    controller : your_controller
                    isTimerTextShown: false,
                    neumorphicEffect: false,
                    innerFillGradient: LinearGradient(colors: [
                      Colors.greenAccent.shade200,
                      Colors.blueAccent.shade400
                    ]),
                    neonGradient: LinearGradient(colors: [
                      Colors.greenAccent.shade200,
                      Colors.blueAccent.shade400
                    ]),
                   ),
</pre>

![no txt nor neum](https://media.giphy.com/media/MOXJxXZsLpxoLdak2u/giphy.gif?cid=790b761146635c380274d3241d0871c3562c78316abe2348&rid=giphy.gif "preview with no text nor neumorphic border")


## Parameters
|Name|Type|Default Value|Description
|:-------------|:----------|:--------|:------------|
|`key`|`Key`|null|*Key for Countdown Timer.*|
|`neon`|`double`|4.0|*The itensity of the neon*|
|`duration`|`int`|required|*Countdown duration in Seconds.*|
|`initialDuration`|`int`|0|*Countdown initial elapsed Duration in Seconds.*|
|`controller`|`CountDownController`|required|*Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.*|
|`width`|`double`|required|*Width of the rectangle that surrounds the circle ( Diameter of the Countdown Timer).*|
|`neonColor`|`Color`|Colors.white54|*neon Color for Countdown Widget.*|
|`neonGradient`|`Gradient`|null|*neon Gradient for Countdown Widget. Note that neonColor will not be effective if gradient is provided.*|
|`neumorphicEffect`|`bool`|true|*show neumorphic border*|
|`innerFillColor`|`Color`|Colors.black12|*Filling Color for Countdown Widget.*|
|`innerFillGradient`|`Gradient`|null|*Filling Gradient for Countdown Widget. Note that fillColor will not be effective if gradient is provided.*|
|`outerStrokeColor`|`Color`|Colors.white|*border Color for Countdown Widget.*|
|`backgroundColor`|`Color`|Colors.white54|*must be provided if you choose to use neumorphic effect .*|
|`outerStrokeGradient`|`Gradient`|null|*border Gradient for Countdown Widget. Note that backgroundColor will not be effective if gradient is provided.*|
|`strokeWidth`|`double`|10.0|*Border Thickness of the Countdown Ring.*|
|`strokeCap`|`StrokeCap`|StrokeCap.round|*Begin and end contours with a flat edge and no extension.*|
|`textStyle`|`TextStyle`|Theme.of(context).textTheme.headline3|*Text Style for Countdown Text.*|
|`textFormat`|`String`|TextFormat.MM_SS|*Format for the Countdown Text.*|
|`isReverse`|`bool`|false|*Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).*|
|`isReverseAnimation`|`bool`|false|*Handles Animation Direction (true for Reverse Animation, false for Forward Animation).*|
|`isTimerTextShown`|`bool`|true|*Handles visibility of the Countdown Text.*|
|`autoStart`|`bool`|true|*Handles the timer start.*|
|`onStart`|`VoidCallback`|null|*This Callback will execute when the Countdown Starts.*|
|`onComplete`|`VoidCallback`|null|*This Callback will execute when the Countdown Ends.*|

## About the Controller
to get the time in seconds use :

<pre>
controller.getCurrentTimeInSeconds();
</pre>

to get the time formated into the selected TextFormat use:

<pre>
controller.getTime();
</pre>

to control the timer use :

<pre>
controller.restart(); // to reset the timer
controller.start(); // to start the timer from 0
controller.pause(); // to pause the timer
controller.resume(); // to continue from the value where the timer stopped
</pre>