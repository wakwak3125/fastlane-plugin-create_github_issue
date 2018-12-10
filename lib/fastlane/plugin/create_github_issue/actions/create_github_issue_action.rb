require 'fastlane/action'
require_relative '../helper/create_github_issue_helper'

module Fastlane
  module Actions
    class CreateGithubIssueAction < Action
      def self.run(params)
        other_action.github_api(
          server_url: "https://api.github.com",
          api_token: params[:api_token],
          http_method: 'POST',
          path: "/repos/#{params[:repo]}/issues",
          body: {
            title: params[:title],
            body: params[:body] || "",
            labels: params[:labels] || [],
            assignees: params[:assignees] || [],
            milestone: params[:milestone]
          }
        )
      end

      def self.description
        "Create GitHub issue"
      end

      def self.authors
        ["Ryo Sakaguchi"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Create GitHub issue"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :api_token,
                                       env_name: '',
                                       description: "Your github token",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :repo,
                                       env_name: '',
                                       description: 'Repository that you want to create an issue, format -> owner/name',
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :title,
                                       env_name: '',
                                       description: "Issue title",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :body,
                                       env_name: '',
                                       description: 'Issue body',
                                       optional: true,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :labels,
                                       env_name: '',
                                       description: 'Issue labels',
                                       optional: true,
                                       type: Array),
          FastlaneCore::ConfigItem.new(key: :assignees,
                                       env_name: '',
                                       description: 'Issue assignees',
                                       optional: true,
                                       type: Array),
          FastlaneCore::ConfigItem.new(key: :milestone,
                                       env_name: '',
                                       description: 'Issue milestone',
                                       optional: true,
                                       type: String)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end

