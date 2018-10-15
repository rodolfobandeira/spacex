## How to Contribute to the SpaceX gem?

### Fork the repository

```
git clone https://github.com/rodolfobandeira/spacex.git
cd spacex
git remote add upstream https://github.com/rodolfobandeira/spacex.git
bundle install
```

### Write test

We use `rspec`. After writing your tests, you can run tests with the following command:

`bundle exec rspec`


### Write your code

Write your code to make your tests pass. After that, make sure you run `Rubocop` like this:

`bundle exec rubocop`

Sometimes errors can be fixed by running:

`bundle exec rubocop -a`

### Update the CHANGELOG with the description of your code and your name

Update the CHANGELOG with the description of your code and your name on the line after `"* Your contribution here"`.

### Push your change and open a pull request

Thank you!
