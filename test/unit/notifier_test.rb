require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "new_ticket" do
    @expected.subject = 'Notifier#new_ticket'
    @expected.body    = read_fixture('new_ticket')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifier.create_new_ticket(@expected.date).encoded
  end

  test "new_comment" do
    @expected.subject = 'Notifier#new_comment'
    @expected.body    = read_fixture('new_comment')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifier.create_new_comment(@expected.date).encoded
  end

  test "ticket_finish" do
    @expected.subject = 'Notifier#ticket_finish'
    @expected.body    = read_fixture('ticket_finish')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifier.create_ticket_finish(@expected.date).encoded
  end

  test "ticket_cancel" do
    @expected.subject = 'Notifier#ticket_cancel'
    @expected.body    = read_fixture('ticket_cancel')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifier.create_ticket_cancel(@expected.date).encoded
  end

end
