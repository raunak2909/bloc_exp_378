abstract class CounterEvent{}

class IncrementEvent extends CounterEvent{
  int incBy;
  IncrementEvent({required this.incBy});

}
class DecrementEvent extends CounterEvent{}