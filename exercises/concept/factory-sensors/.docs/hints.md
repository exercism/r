# Hints

## 1. Monitor the humidity level of the room

- If the humidity is too high, just [stop][ref-stopifnot]; no message is needed.
- If conditions are good, you need to issue a [message][ref-message].

## 2. Detect overheating

- Tere are several conditions to test for.
- If you need to [stop][ref-stop], the error message is important.
- A worrying but not-yet-fatal condition needs a [warning][ref-warning].
- A good result needs a reassuring [message][ref-message].
- Remember the boolean return value.

## 3. Monitor the machine

- Tasks 1 and 2 both bave boolean return values that you can test for.

[ref-message]: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/message
[ref-stop]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/stop
[ref-stopifnot]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/stopifnot
[ref-warning]: https://www.rdocumentation.org/packages/base/versions/3.2.4/topics/warning
