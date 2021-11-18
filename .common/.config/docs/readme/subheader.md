<div align="center">
  <h4 align="center">
    <a href="{{ website.homepage }}" title="Megabyte Labs homepage" target="_blank">
      <img src="https://gitlab.com/megabyte-labs/assets/-/raw/master/svg/home-solid.svg" />
    </a>
    <a href="https://app.vagrantup.com/{{ variables.vagrantup_user }}/boxes/{{ variables.box_basename }}" title="{{ variables.description }} box on VagrantUp.com" target="_blank">
      <img height="50" src="https://gitlab.com/megabyte-labs/assets/-/raw/master/svg/vagrant.svg" />
    </a>
    <a href="{{ repository.group.packer }}/{{ slug }}/-/blob/master/CONTRIBUTING.md" title="Learn about contributing" target="_blank">
      <img src="https://gitlab.com/megabyte-labs/assets/-/raw/master/svg/contributing-solid.svg" />
    </a>
    <a href="{{ profile.patreon }}" title="Support us on Patreon" target="_blank">
      <img src="https://gitlab.com/megabyte-labs/assets/-/raw/master/svg/support-solid.svg" />
    </a>
    <a href="{{ chat_url }}" title="Slack chat room" target="_blank">
      <img src="https://gitlab.com/megabyte-labs/assets/-/raw/master/svg/chat-solid.svg" />
    </a>
    <a href="{{ profile.github }}/packer-{{ slug }}" title="GitHub mirror" target="_blank">
      <img src="https://gitlab.com/megabyte-labs/assets/-/raw/master/svg/github-solid.svg" />
    </a>
    <a href="{{ repository.group.packer }}/{{ slug }}" title="GitLab repository" target="_blank">
      <img src="https://gitlab.com/megabyte-labs/assets/-/raw/master/svg/gitlab-solid.svg" />
    </a>
  </h4>
  <p align="center">
    <a href="{{ repository.group.npm }}/{{ slug }}" target="_blank">
      <img alt="Version: {{ pkg.version }}" src="https://img.shields.io/badge/version-{{ pkg.version }}-blue.svg?cacheSeconds=2592000" />
    </a>
    <a href="{{ repository.group.packer }}/{{ slug }}/commits/master" target="_blank">
      <img alt="Pipeline status" src="{{ repository.group.packer }}/{{ slug }}/badges/master/pipeline.svg">
    </a>
    <a href="{{ repository.group.packer }}/{{ slug }}" target="_blank">
      <img alt="Last commit date" src="https://img.shields.io/github/last-commit/{{ profile.github_user }}/packer-{{ slug }}?logo=git&logoColor=white&style={{ badge_style }}" />
    </a>
    <a href="{{ website.documentation }}/packer" target="_blank">
      <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg?style={{ badge_style }}" />
    </a>
    <a href="{{ repository.group.packer }}/{{ slug }}/-/raw/master/LICENSE" target="_blank">
      <img alt="License: {{ pkg.license }}" src="https://img.shields.io/badge/license-{{ pkg.license }}-yellow.svg?style={{ badge_style }}" />
    </a>
    <a href="{{ profile.opencollective }}" title="Support us on Open Collective" target="_blank">
      <img alt="Open Collective sponsors" src="https://img.shields.io/opencollective/sponsors/megabytelabs?label=Open%20Collective%20sponsors&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgBAMAAACBVGfHAAAAElBMVEUAAACvzfmFsft4pfD////w+P9tuc5RAAAABHRSTlMAFBERkdVu1AAAAFxJREFUKM9jgAAXIGBAABYXMHBA4yNEXGBAAU2BMz4FIIYTNhtFgRjZPkagFAuyAhGgHAuKAlQBCBtZB4gzQALoDsN0Oobn0L2PEUCoQYgZyOjRQFiJA67IRrEbAJImNwFBySjCAAAAAElFTkSuQmCC&style={{ badge_style }}" />
    </a>
    <a href="{{ profile.github }}" title="Support us on GitHub" target="_blank">
      <img alt="GitHub sponsors" src="https://img.shields.io/github/sponsors/{{ profile.github_user }}?label=GitHub%20sponsors&logo=github&style={{ badge_style }}" />
    </a>
    <a href="{{ profile.github }}" target="_blank">
      <img alt="GitHub: {{ profile.github_user }}" src="https://img.shields.io/github/followers/{{ profile.github_user }}?style=social" target="_blank" />
    </a>
    <a href="https://twitter.com/{{ profile.twitter }}" target="_blank">
      <img alt="Twitter: {{ profile.twitter }}" src="https://img.shields.io/twitter/url/https/twitter.com/{{ profile.twitter }}.svg?style=social&label=Follow%20%40{{ profile.twitter }}" />
    </a>
  </p>
</div>
