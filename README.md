# StyledString

`StyledString` is a small utility  that can perform various substring substitutions for styling and
formatting purposes. It comes with a handful of styles, but also allows custom styles to be added
as well and can even override built-in styles.

## Usage

To identify styled substrings, wrap them inside curly brackets, and specify the styles to be
applied after a colon, separated by a comma. For instance:
```swift
let message: StyledString = "This message is {very:body,red} important."
```
Some styles may require parameters. Those should be specified after the name of the style,
separated by a space. For instance:
```swift
let message: StyledString = "This message is {very:rgb 67 115 50} green."
```

Note that styles are applied in order, which may be of importance when applying styles that
expect the subject to be parsed in a certain way (e.g. `round`).

### Create custom styles

You can create custom styles by registering them to `StyledString`'s static `styles` dictionary.
All styles must conform to the `Style` protocol that comes with the library. Here's an example:

```swift
struct Lowercase: Style {
  public func apply(on subject: String, parameters: [Substring]) -> String {
    return subject.lowercased()
  }
}

StyledString.styles["lowercase"] = Lowercase()
let s: StyledString = "HELLO, {WORLD:lowercase}!"
print(s)
// Prints "HELLO, world!"
```

You can also override existing styles by simply registering another style to the same name. For
instance:

```swift
struct HTMLBold: Style {
  public func apply(on subject: String, parameters: [Substring]) -> String {
    return "<b>\(subject)</b>"
  }
}

StyledString.styles["bold"] = HTMLBold()
let s: StyledString = "Hello, {World:bold}!"
print(s)
// Prints "Hello, <b>World</b>!"
```

## Installation

You can add StyledString to your dependencies via Swift's Package Manager, or simply copy the
unique source file into your own project.

## Styles

Here's a list of the built-in styles available:

* `< width [pad]`:
  Pads the align the subject to the left, adding padding characters to the right until the
  substring is `width` characters long. If the padding character (i.e. `pad`) is not provided, a
  space character will be used by default.
* `> width [pad]`:
  Pads the align the subject to the right, adding padding characters to the left until the
  substring is `width` characters long. If the padding character (i.e. `pad`) is not provided, a
  space character will be used by default.
* `bold`:
  Sets the subject in bold.
* `dimmed`:
  Display the subject with a dimmed color.
* `italic`:
  Sets the subject in italic.
* `underline`:
  Underlines the subject.
* `blink`:
  Make the subject blink.
* `reversed`:
  Inverts the foreground and background colors.
* `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`, `rgb r b g`:
  Sets the subject in the specified color.
* `bgblack`, `bgred`, `bggreen`, `bgyellow`, `bgblue`, `bgmagenta`, `bgcyan`, `bgwhite`:
  Sets the background of the subject in the specified color.
* `round n`:
  Rounds the numeric subject to the specified number of decimals.
