# C42 Engineering Coding Puzzle

*VERY IMPORTANT:* Please read the following document carefully. You are being assessed on your attention to detail.

### FAQ

* This is not a programming problem, this is a puzzle. This puzzle is designed to test your (online) research, analytical and problem solving skills.
* You have four full days to solve the problem. You will also need an internet connection.
* It is perfectly ok to submit an incomplete solution. We care about how you solved the problem more than how much of it you solved. Please track your progress with frequent (ideally every 15-20 mins.) commits using Git. Your analytical and problem solving skills are evaluated almost entirely based on your *git log* so please make sure that your messages are meaningful.
* This puzzle is designed for people from *non programming backgrounds*. Some knowledge of programming will help but is not essential.
* Please don't hesitate to ask us questions when you don't understand something about this puzzle or the problem statement. In fact, we strongly encourage it.
* This README only addresses Linux and OSX. If you're using Windows, we will have a hard time helping you out if you have any technical issues.

### The Problem

We have a partial implementation of the famous "Conway's Game of Life" cellular automaton. http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

This partial implementation was carelessly stored on a USB stick that was damaged. Much of the source code in the project were lost, though the rest of the project survives intact, most notably the automated specification suite along with executables

Your task is to recreate the lost source code by reverse engineering the automated specification suite.

### Suggested Approach

1. Follow the Setup instructions below to get the project to build and see all the failing specifications listed.
2. Use the internet for research and do your own experiments to pass the specs one at a time.
3. Keep saving your progress frequently (every 15-20 mins) using Git.
4. Repeat until you get the full build with all 55 automated specifications passing or you run out of time. 
5. Getting all 55 specifications to pass is not necessary, but is definitely a bonus.

### Getting Setup

Getting your setup going is part of the puzzle.

1. Install Git[1].
2. Install Ruby 2.2.0[2]. There are several ways to do this. rbenv[3] or RVM[4] are probably easiest.
3. Install Bundler[5].

[1] http://git-scm.com/
[2] https://www.ruby-lang.org/en/
[3] https://github.com/sstephenson/rbenv
[4] https://rvm.io/
[5] http://bundler.io/

### Running the Build

1. Navigate to the project root in your terminal.
2. Test that Ruby is setup and working by running the command `ruby -v` to print the version of Ruby. On OSX this returns something like this: `ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin13]`.
3. Install all the libraries this project uses by running `bundle install`. If this succeeds, a new file called `Gemfile.lock` is created in project root.
4. Run all automated specifications using the command `bundle exec rake`.
5. Run a specific automated test using the command `bundle exec rspec spec/path/to/file_spec.rb`
5. You should see 55 failing examples.
6. Fix an example.
7. This project already uses Git. Run `git log` to see the one commit have already made as your starting point for this puzzle. Now add your changes and make a commit to save them.
8. To see the output you can execute sample scripts in bin by running `ruby bin/oscillator.rb` or `ruby bin/spaceship.rb`

### Submitting a Solution

When you are ready, please zip up the entire project directory (including the .git subdirectory in project root) and send it to us.

To reiterate, please ensure you track your progress using frequent Git commit messages.

### Tips and Reading material

* Experiment with Ruby at http://rubymonk.com, a product created and run pro bono by C42 Engineering that teaches Ruby to 3,50,000 people annually.
* If you're using Windows, consider installing Ruby using http://rubyinstaller.org/
* Need a convenient, free editor? Try Sublime: http://www.sublimetext.com/
* This project uses RSpec 3.x for automated specifications. Documentation at https://www.relishapp.com/rspec/
* Learn basic Git commands like `add`, `commit`, `pull`, `push`.
* Understand what Git logs are and how you can view them.
* Try out a visual Git tool like GitK on KDE and GitX on OSX.
* Learn basic terminal commands like `cd`, `ls`, `cp`, `touch` and `mv`.
* Run `bundle exec rake -T` at project root to list all available tasks.