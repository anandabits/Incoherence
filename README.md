# Incoherence
An example demonstrating the "incoherent instances" problem in Swift

While the language tries hard to prevent it, it is possible to have two conformances of the same type to the same protocol 
in the same Swift program.  This sample demonstrates the problem by showing how two values of the same `SortedArray<T: Comparable>`
type can end up using _different_ `T: Comparable` conformances.  You can find some discussion on Twitter: https://twitter.com/anandabits/status/979677851405385731

The existence of this problem leads to the common advice to only provide protocol conformances in a module that declares either
the type or the protocol.

Ed Kmett discussed this problem as it exists in Haskell in his talk [Type Classes vs the World](https://t.co/rzHuU1BjHK?amp=1)

NOTE: The code contained in this repo was written a couple of years ago.  It appears to have a linker error now and 
      I don't have time to figure out what the problem is, but was executable at the time it was written.
