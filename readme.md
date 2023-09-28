# gml-sourceui
An evil, slow, and silly UI library for GameMaker

## Inspiration
This project draws heavily on [Jetpack Compose](https://developer.android.com/jetpack/compose).

While probably *(definitely)* not a good fit for GML, the main point is fun, and learning about
the internals of such projects. Particular pain point here is that GML lacks closures, making the
main way that Compose does things close to impossible without being incredibly tedious and unfun.

Given that, instead the focus is on using *structs*, particularly using them as pseudo-classes.
