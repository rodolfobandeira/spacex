# message("Hello, this worked")

# DECLARE A PR TO BE SIMPLE TO AVOID SPECIFIC DANGER RULES
declared_trivial = (github.pr_title + github.pr_body).include?('#trivial')

warn 'This is a big PR eh? If possible, consider a small PR to help the code review process' if git.lines_of_code > 500
warn 'This PR does not have any reviewers yet.' unless github.pr_json['reviewers'].nil?

# Sometimes its a README fix, or something like that - which isn't relevant for
# including in a CHANGELOG for example
has_app_changes = !git.modified_files.grep(/lib/).empty?
has_test_changes = !git.modified_files.grep(/spec/).empty?

# Add a CHANGELOG entry for app changes
if !git.modified_files.include?('CHANGELOG.md') && (has_app_changes || has_test_changes) && !declared_trivial
  failure "Please include a CHANGELOG entry. \nYou can find it at [CHANGELOG.md](https://github.com/rodolfobandeira/spacex/blob/main/CHANGELOG.md)."
  message 'Note: Try to keep it simple. Just a short description with less than 10 words.'
end

failure 'byebug left in tests' if `grep -r byebug spec/ `.length > 1
failure 'binding.pry left in tests' if `grep -r binding.pry spec/ `.length > 1
failure 'Please provide a summary in the Pull Request description' if github.pr_body.length < 5

# Rubocop
github.dismiss_out_of_range_messages # This and folling lines will make sure Rubocop runs only for the new
inline_comment = true                # or modified lines only
fail_on_inline_comment = true        # Fails instead of just "warn" for failed rubocop issues on new or modified files
rubocop.lint
