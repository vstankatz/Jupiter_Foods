# _Jupiter Foods_

##### _Fake Company Database Using Ruby and Rails for Epicodus, 01/17/20_

#### By _**Veronica Stanley-Katz**_

## Description

_This program was designed to allow the admin of a fake company to view, update, and delete products and reviews to those products. This program was created for an Epicodus assignment geared at understanding ruby and rails with a one-to-many relationship._

## Specs

|Specs|Input|Output|
|-|-|-|
|The program should allow the user to add a product.| "Apple Butter"| Product List: Apple Butter|
|The program should allow the user to edit a product.| Edit "Apple Butter" to "Canna Butter" |Product List: Canna Butter|
|The program should allow the user to delete a product. |Delete "Canna Butter" |Product List: *empty*|
|The program should allow the user to add a review.| "This apple butter was terrible, 0 apples and 0 butter" |Apple Butter Reviews: This apple butter was terrible, 0 apples and 0 butter|
|The program should allow the user to edit a review.| Edit "This apple butter was terrible, 0 butter" to "I had no idea apple butter was just mashed up apples and cinnamon!" |Apple Butter Reviews: I had no idea apple butter was just mashed up apples and cinnamon!|
|The program should allow the user to delete a review.| Delete "I had no idea apple butter was just mashed up apples and cinnamon!"| Volunteer List: *empty*|


## Setup-Installation Requirements

### To Run Locally
* _Go to https://github.com/vstankatz/Jupiter_Foods_
* _Clone the GitHub repository._
* _In your terminal/command line go into the folder that was cloned and run "bundle", "rake db:create" , "rake db:migrate", "rake db:test:prepare", "rake db:seed", "rails s" to prepare your database and start the server._
* _Once the server loads go to your browser and input 'localhost:' into your browser with the port given by your terminal._
* _Use the site as desired!_

### To Run Remotely
* _Go to https://hidden-taiga-30916.herokuapp.com/
* _Use the site as desired!_

## Known Bugs
_Unable to pass one capybara test due to the radio button style for the edit a review path. To run test, go to file in your terminal and type "rspec"._

## Technologies Suggested
* _Ruby 2.5.1_
* _Rails 6.0.2.1_
* _Gems:_
  * _rspec_
  * _pry_
  * _simplecov_
  * _jquery-rails
  * _bundler_
  * _capybara_
  * _pg_
  * _faker_
  * _faker_
  * _webpacker_
  * _puma_
  * _turbolinks_
  * _launchy_
  * _web-console_
  * _devise_
  * _shoulda-matchers_
* _Markup_
* _Psql_

### License

Copyright (c) 2019 **_Veronica Stanley-Katz_**

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
