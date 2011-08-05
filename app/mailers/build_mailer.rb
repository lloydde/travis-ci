class BuildMailer < ActionMailer::Base
  default :from => 'notifications@travis-ci.org'

  helper BuildMailerHelper

  def finished_email(build)
    @build     = build
    @commit    = build.commit
    subject    = "#{build.repository.slug}##{build.number} (#{@commit.branch} - #{@commit.commit[0, 7]}): the build has #{build.passed? ? 'passed' : 'failed' }"
    recipients = build.email_recipients
    mail(:to => recipients, :subject => subject)
  end
end
