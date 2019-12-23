#!/usr/bin/env ruby

build_targets = {
  "linux" => %w(386 amd64 arm),
  "darwin" => %w(386 amd64),
  "windows" => %w(386 amd64),
}

build_targets.each do |os, platforms|
  platforms.each do |platform|
    `GOOS=#{os} GOARCH=#{platform} go build -o bin/artist-#{os}-#{platform} .`
  end
end
