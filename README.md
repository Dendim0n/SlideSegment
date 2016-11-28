# SlideSegment
A Horizontal/Vertical Segmented Control With Full Autolayout Support.

##Usage:

         let doSomething:(Int) -> Void = {

            num in

            print("clicked:\(num)")

         }

         let segment = SlideSegmentSelector.init(singlePage: true, length: 180, direction: .horizontal,do: doSomething)

##Arguments:

         singlePage: Put all segment in one screen.

         length:Width/Height for every segment.

         direction: .horizontal / .vertical

         do: A closure, type: (Int) -> Void

##Demo:(See more in the project)

![image](demo.gif)