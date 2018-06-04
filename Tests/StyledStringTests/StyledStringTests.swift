import XCTest
@testable import StyledString

struct Parens: Style{
  func apply(on subject: String, parameters: [Substring]) -> String {
    return "(\(subject))"
  }
}

final class StyledStringTests: XCTestCase {

  override func setUp() {
    StyledString.styles["wrapped"] = Parens()
  }

  func testCustom() {
    let s: StyledString = "{koala:wrapped}"
    XCTAssertEqual(s.first!, "(")
    XCTAssertEqual(s.last!, ")")
  }

  static var allTests = [
    ("testCustom", testCustom),
  ]

}
