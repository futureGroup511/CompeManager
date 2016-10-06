
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>10组CSS3鼠标滑过文字动画特效DEMO演示</title>

    <style>
@charset "UTF-8";

img{
	margin-top:5px;
	margin-left:-60%;
}
.header span{
 position:absolute;
  margin-top:-30px;
}
* {
  box-sizing: border-box;
}

body {

  background-color:#277BD1;
}
.headingWrapper {
  text-align: center;
  background-color: #fff;
  
}
.header {
  display: inline-block;
  text-align: center;
  font-family: 'Francois One', Helvetica, Arial, sans-serif;
  font-size:45px;
  color: #e7e7e7;
  text-decoration: none;
  text-shadow: 1.5px 1.5px 0 #cac6c5, -1.5px -1.5px 0 #cac6c5, -1.5px -1.5px 0 #cac6c5, -1.5px 1.5px 0 #cac6c5, 1.5px -1.5px 0 #cac6c5;
  transition: all 400ms ease-in-out;
   margin-left:20%;
}

.header--pushDown {
  text-shadow: 1.5px 1.5px 0 yellow, 0px 1.5px 0 yellow, -1.5px -1.5px 0 yellow, -1.5px -1.5px 0 yellow, -1.5px 1.5px 0 yellow, 1.5px -1.5px 0 yellow, 0.77782px 0.77782px 0 black, 1.55563px 1.55563px 0 black, 2.33345px 2.33345px 0 black, 3.11127px 3.11127px 0 black, 3.88909px 3.88909px 0 black, 4.6669px 4.6669px 0 black, 5.44472px 5.44472px 0 black, 6.22254px 6.22254px 0 black, 7.00036px 7.00036px 0 black, 7.77817px 7.77817px 0 black;
}

.color-bright {
  background-image:url(images/beijing.jpg);
}
.color-bright .header {
  color:black;
  text-shadow: 1.5px 1.5px 0 green, -1.5px -1.5px 0 green, -1.5px -1.5px 0 green, -1.5px 1.5px 0 green, 1.5px -1.5px 0 green;
}
.color-bright .header--pushDown {
  text-shadow: 1.5px 1.5px 0 #fff, 0px 1.5px 0 #fff, -1.5px -1.5px 0 #fff, -1.5px -1.5px 0 #fff, -1.5px 1.5px 0 #fff, 1.5px -1.5px 0 #fff, 0.77782px 0.77782px 0 #ffffff, 1.55563px 1.55563px 0 #fff, 2.33345px 2.33345px 0 #fff;
}


/*
  These mixins are included in Codepen (and Compass) by default, but if you wanted to use them in your own project, here they are:

@function pow($number, $exp) {
  $value: 1;
  @if $exp > 0 {
    @for $i from 1 through $exp {
      $value: $value * $number;
    }
  }
  @else if $exp < 0 {
    @for $i from 1 through -$exp {
      $value: $value / $number;
    }
  }
  @return $value;
}

@function fact($number) {
  $value: 1;
  @if $number > 0 {
    @for $i from 1 through $number {
      $value: $value * $i;
    }
  }
  @return $value;
}

@function pi() {
  @return 3.14159265359;
}

@function rad($angle) {
  $unit: unit($angle);
  $unitless: $angle / ($angle * 0 + 1);
  // If the angle has 'deg' as unit, convert to radians.
  @if $unit == deg {
    $unitless: $unitless / 180 * pi();
  }
  @return $unitless;
}

@function sin($angle) {
  $sin: 0;
  $angle: rad($angle);
  // Iterate a bunch of times.
  @for $i from 0 through 10 {
    $sin: $sin + pow(-1, $i) * pow($angle, (2 * $i + 1)) / fact(2 * $i + 1);
  }
  @return $sin;
}

@function cos($angle) {
  $cos: 0;
  $angle: rad($angle);
  // Iterate a bunch of times.
  @for $i from 0 through 10 {
    $cos: $cos + pow(-1, $i) * pow($angle, 2 * $i) / fact(2 * $i);
  }
  @return $cos;
}

*/

</style>

   

</head>

<body>

  <!-- I made this pen to try out and illustrate some of the subtle shadow effects you can create using just text-shadow and transitions.  The pattern effect also uses a small piece of SVG.

Inspired by this animated gif I saw on dribbble (https://dribbble.com/shots/1881907-Love?list=shots&sort=recent&timeframe=now&offset=18).

I’ve included the Sass mixins I use to make the text-shadow effect, but you could also just use compass which has these mixins baked straight in.

The CSS only effects (first 4) work in Chrome/Firefox/Safari/IE10+.

The final pattern effect works perfectly in Chrome, Firefox and IE seems to lose the text-shadow for some reason and it completely flips out in Safari!
-->


<div class="headingWrapper color-bright" style="margin-left:-3.8%;height:140px;margin-top:-10px;padding-top:-10px;">
  <img src="images/header-logo.png" width="100" height="95" style="margin-top:1%">
 　 <span style="font-size:34px;position:absolute; margin-top:40px;color:white;margin-left:-1%; font-family: 'Francois One', Helvetica, Arial, sans-serif;">河南科技学院</span>
  <p class="header header--pushDown header--shadow" title="HOVER ME" style="paddint-left:-20%;"><span>大学生竞赛管理系统</span></p>
</div>

</body>

</html>