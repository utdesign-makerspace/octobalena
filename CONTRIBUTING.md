# Where to put scripts
If adding scripts to a project, they should be in a well defined location. Currently I am opting to put them in `/usr/src/octobalena` relative to the container scope.

# Making a commit message
You should include three things in a basic commit.

`Scope:` What container does it effect?

`Change-type:` [ major | minor | patch ] as defined by [semantic versioning](https://semver.org/)

`Signed-off-by:` Your name and email

Here is an example of a simple change that includes those three things

```
octoprint: add thing to the thing

Change-type: patch
Signed-off-by: Matthew Croughan <matt@email.com>
```

This was accomplished by using multiple messages at the git command line.

`git commit -m "add thing to the thing" -m "Change-type: patch" -m "Signed-off-by: Matthew Croughan <matt@email.com>"`
