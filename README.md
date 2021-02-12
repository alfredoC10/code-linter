# CSS code linter built in Ruby

## About
This code linter tool comes from working on the capstone project of the Microverse Ruby course, a interesting experience due to lots of new concepts that can be learned. The tool delivers feedback on programming misspellings made in a CSS file. Pure Ruby code was used in its building. I utilized Rubocop as code linter to adhere to the business requirements, Gitflow and good practices assigned to me.

![screenshot](https://github.com/Huemac-Alfredo/code-linter/blob/code/images/linter.PNG)

## good practices it looks for
- No spaces before semicolons
- Presence of a single space after a colon
- Presence of a single space after a comma
- Each selector must be in a new line when they are listed in the same rule

## Built with
- Ruby
- VS Code
- Rubocop
- RSpec gem

## Getting started

### Prerequisites
- Browser (Google Chrome, Mozilla Firefox, Safari or any other browser)
- Text editor (strongly recommended VS Code)
- Empty directory where the repo is to be cloned

### To get a local copy of this repo
Run the following comands in the terminal in the next order:

- Step 1:  
$ cd "here comes the path of your selected directory (double quotes must not be here)"

- Step 2:
$ git clone https://github.com/Huemac-Alfredo/code-linter.git

### To test a CSS file
- Step 1: "code-linter" directory must be opened in your terminal, this is going to be the root directory. For acomplishing this, here is this command:

cd code-linter

- Step 2: to test a file, the next command must be followed by your css file's path:

ruby bin/main.rb

e.g.

ruby bin/main.rb ./css/sample_bad.css

## Examples of good and bad practices
Next, are here examples to better ilustrate the kind of rules this linter looks for to be followed, while writing CSS code:


### - No spaces before semicolons (;)

- Bad
<img src="https://github.com/Huemac-Alfredo/code-linter/blob/code/images/space_semicolon_bad.PNG" width="210px">

- Good
<img src="https://github.com/Huemac-Alfredo/code-linter/blob/code/images/space_semicolon_good.PNG" width="210px">


### - Presence of a single space after a colon (:)

- Bad
<img src="https://github.com/Huemac-Alfredo/code-linter/blob/code/images/space_colon_bad.PNG" width="140px">

- Good
<img src="https://github.com/Huemac-Alfredo/code-linter/blob/code/images/space_colon_good.PNG" width="120px">


### Presence of a single space after a comma (,)

- Bad
<img src="https://github.com/Huemac-Alfredo/code-linter/blob/code/images/space_comma_bad.PNG" width="420px">

- Good
<img src="https://github.com/Huemac-Alfredo/code-linter/blob/code/images/space_comma_good.PNG" width="420px">


### Each selector must be in a new line when they are listed in the same rule

- Bad
<img src="https://github.com/Huemac-Alfredo/code-linter/blob/code/images/selector_bad.PNG" width="130px">

- Good
<img src="https://github.com/Huemac-Alfredo/code-linter/blob/code/images/selector_good.PNG" width="130px">

## Authors

👤 **Alfredo Huemac**

- Github: [@Huemac-Alfredo](https://github.com/Huemac-Alfredo)
- Twitter: [@AlfredoHuemac](https://twitter.com/AlfredoHuemac)
- Linkedin: [Alfredo Huemac Córdova](https://https://www.linkedin.com/in/alfredo-huemac/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Huemac-Alfredo/code-linter/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse
- The Odin Project
- Anyone whose detailed code inspired the creation of this project, keep doing amazing stuff!












