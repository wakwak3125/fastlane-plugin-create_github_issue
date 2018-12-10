describe Fastlane::Actions::CreateGithubIssueAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The create_github_issue plugin is working!")

      Fastlane::Actions::CreateGithubIssueAction.run(nil)
    end
  end
end
