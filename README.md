Escaping Quarantine

This is a short terminal-based adventure about getting outside during a quarantine. The player navigates the game world by inputting commands through the number keys and by typing responses to prompts (i.e. 'yes' or 'no'). The core gameplay loop is to walk into a room and to search the furniture until the player finds both a 'mask' item and a 'gloves' item. Once the player has found both items, they can navigate to the front door and walk outside. At that point, their score is determined by the number of moves they needed to complete the game. Their score is saved and added to a permanent highscore roster, and the game ends.

Installation

Download the game files and run bundle install. 

Contributors

If you'd like contribute to this project, we have a few suggestions on where to start

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
3. Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.
4. Make sure your project checks off each of the above requirements.
5. Prepare a video demo (narration helps!) describing how a user would interact with your working project.
    * The video should:
      - Have an overview of your project.(2 minutes max)
6. Prepare a presentation to follow your video.(3 minutes max)
    * Your presentation should:
      - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
      - Discuss 3 things you learned in the process of working on this project.
      - Address, if anything, what you would change or add to what you have today?
      - Present any code you would like to highlight.   
7. *OPTIONAL, BUT RECOMMENDED*: Write a blog post about the project and process.

---
### Common Questions:
- How do I turn off my SQL logger?
```ruby
# in config/environment.rb add this line:
ActiveRecord::Base.logger = nil
```
