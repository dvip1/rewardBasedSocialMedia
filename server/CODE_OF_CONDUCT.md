# Code of Conduct

## 1. Purpose

A primary goal of [Your Project] is to be inclusive to the largest number of contributors, with the most varied and diverse backgrounds possible. As such, we are committed to providing a friendly, safe and welcoming environment for all, regardless of gender, sexual orientation, ability, ethnicity, socioeconomic status, and religion (or lack thereof).

## 2. Expected Behavior

The following behaviors are expected and requested of all community members:

- Participate in an authentic and active way. In doing so, you contribute to the health and longevity of this community.
- Exercise consideration and respect in your speech and actions.
- Attempt collaboration before conflict.
- Refrain from demeaning, discriminatory, or harassing behavior and speech.
- Be mindful of your surroundings and of your fellow participants.

## 3. Unacceptable Behavior

The following behaviors are considered harassment and are unacceptable within our community:

- Violence, threats of violence or violent language directed against another person.
- Sexist, racist, homophobic, transphobic, ableist or otherwise discriminatory jokes and language.
- Posting or displaying sexually explicit or violent material.
- Personal insults, particularly those related to gender, sexual orientation, race, religion, or disability.
- Any other conduct which could reasonably be considered inappropriate in a professional setting.

## Commit style 
The commit style is based on [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/). The commit message should be structured as follows:

- `<type>`: This represents the type of change that the commit is providing. Common types include feat (for new features), fix (for bug fixes), docs (for documentation changes), style (for formatting, missing semi colons, etc; no code change), refactor (for refactoring code), test (for adding missing tests), chore (for maintenance tasks).

- `[optional scope]`: This is an optional part that provides additional contextual information, like the part of the codebase the change pertains to.

- `<description>`: A brief description of the change.

- `[optional body]`: More detailed explanatory text, if necessary. Wrapped to about 72 characters.

- `[optional footer(s)]`: Place to mention any issues that this commit closes.

### Examples

``` bash 
feat(user-auth): add password reset functionality

This commit adds the ability for users to reset their password via email. It includes a new route, controller method, and email template.

Closes #123
```