module hello_world;

string hello()
{
    return venusian_interference();
}

string venusian_interference()
{
  return "Good morning, evening star!";  
}

unittest
{
    // Say Hi!
    assert(hello() == venusian_interference());
}
