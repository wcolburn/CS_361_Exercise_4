# Exercise 5 Part 1 (Exception Handling)

class MentalState
  def auditable?
    # true if the external service is online, otherwise false
  end
  def audit!
    # Could fail if external service is offline
  end
  def do_work
    # Amazing stuff...
  end
end

def audit_sanity(bedtime_mental_state)

  if bedtime_mental_state.auditable?
    MorningMentalState.new()
  else
    raise Exception.new "External service is offline"
end


begin
  new_state = audit_sanity(bedtime_mental_state)
rescue Exception => e
  # Handle the exception
end





# Exercise 5 Part 2 (Don't Return Null / Null Object Pattern)

class BedtimeMentalState < MentalState ; end

class MorningMentalState < MentalState ; end

class NullMentalState < MentalState ; end

def audit_sanity(bedtime_mental_state)
  return NullMentalState.new() unless bedtime_mental_state.auditable?
  MorningMentalState.new()
end

new_state = audit_sanity(bedtime_mental_state)
new_state.do_work




# Exercise 5 Part 3 (Wrapping APIs)

require 'candy_service'

class CandyMachineHandler
  candyMachine = CandyMachine.new
  def prepare
    candyMachine.prepare
  end
  def ready?
    candyMachine.ready?
  end
  def make!
    candyMachine.make!
  end
end

machine = CandyMachineHandler.new
machine.prepare

if machine.ready?
  machine.make!
else
  puts "sadness"
end
