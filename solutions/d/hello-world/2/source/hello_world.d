module hello_world;

string hello()
{
    return "Hello, World!";
}

unittest
{
    // Say Hi!
    assert(hello() == "Hello, World!");
}
