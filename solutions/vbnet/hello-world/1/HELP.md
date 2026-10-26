# Help

## Running the tests

## Exercise files

A downloaded exercise includes these files for building and testing your solution:

```text
hello-world/
├── HelloWorld.vb       # Your solution
├── HelloWorldTests.vb  # The test suite
├── HelloWorld.vbproj   # Project and build configuration
└── packages.lock.json  # Resolved project dependencies
```

The filenames vary by exercise.
Write your solution in the `.vb` file whose name does not end in `Tests`.
The file ending in `Tests.vb` is the xUnit test suite; normally, you should edit it only to remove `Skip` arguments.
You normally do not need to edit the project or lock file.

## Run the tests

Open a terminal in the exercise directory and run:

```bash
dotnet test
```

The command restores the project's dependencies, builds the project, and runs its tests.
You can also use `dotnet watch test` to rerun the tests whenever a source file changes.

## Skipped tests

Exercises initially enable only the first test, allowing you to solve the rest one step at a time.
Open the file ending in `Tests.vb` to find the tests.
Each test is a `Sub` subroutine marked with an xUnit `<Fact>` attribute.
A test will be skipped as long as its `<Fact>` attribute has a `Skip` argument:

```vb
<Fact(Skip:="Remove this Skip property to run this test")>
Public Sub Lowercase_words()
    Assert.Equal("ROR", Abbreviate("Ruby on Rails"))
End Sub
```

To enable the test, just remove the `Skip` argument:

```vb
<Fact>
Public Sub Lowercase_words()
    Assert.Equal("ROR", Abbreviate("Ruby on Rails"))
End Sub
```

After the newly enabled test passes, repeat this process with the next skipped test.
When every test is enabled and passing, you're done.

## Submitting your solution

You can submit your solution using the `exercism submit HelloWorld.vb` command.
This command will upload your solution to the Exercism website and print the solution page's URL.

It's possible to submit an incomplete solution which allows you to:

- See how others have completed the exercise
- Request help from a mentor

## Need to get help?

If you'd like help solving the exercise, check the following pages:

- The [Visual Basic track's documentation](https://exercism.org/docs/tracks/vbnet)
- The [Visual Basic track's programming category on the forum](https://forum.exercism.org/c/programming/vbnet)
- [Exercism's programming category on the forum](https://forum.exercism.org/c/programming/5)
- The [Frequently Asked Questions](https://exercism.org/docs/using/faqs)

Should those resources not suffice, you could submit your (incomplete) solution to request mentoring.

## Blogs

- Microsoft's official [Visual Basic blog](https://devblogs.microsoft.com/vbteam/)

## Forums

- [Discord Visual Basic Community](https://discord.com/invite/vakZ89n)
- [VBForums: Visual Basic .NET](https://www.vbforums.com/forumdisplay.php?25-Visual-Basic-NET)

## Social media

- [Stack Overflow](https://stackoverflow.com/questions/tagged/vb.net)
- [/r/visualbasic](https://www.reddit.com/r/visualbasic/)

## Tutorials

- [Tutlane - Visual Basic Tutorial](https://www.tutlane.com/tutorial/visual-basic)
- Microsoft's own [Get started with Visual Basic in Visual Studio](https://learn.microsoft.com/en-us/visualstudio/get-started/visual-basic/tutorial-console)

## Language development

- [Visual Basic language design repo](https://github.com/dotnet/vblang)