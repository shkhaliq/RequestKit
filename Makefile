install:


test:
	bundle exec fastlane code_coverage configuration:Debug --env default

post_coverage:
	bundle exec slather coverage --input-format profdata -x --ignore "../**/*/Xcode*" --ignore "Carthage/**" --output-directory slather-report --scheme RequestKit RequestKit.xcodeproj
	SHA=$(git rev-parse HEAD)
	BRANCH=$(git name-rev --name-only HEAD)
	curl -X POST -d @slather-report/cobertura.xml "https://codecov.io/upload/v2?token="$(CODECOV_TOKEN)"&commit="$(SHA)"&branch="$(BRANCH)"&job="$(TRAVIS_BUILD_NUMBER)

