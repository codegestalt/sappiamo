# Sappiamo: A Ruby Sappiamo API

This is a Ruby wrapper for the [Sappiamo
API](https://github.com/codegestalt/sappiamo-api).

## Installation

    gem install sappiamo

## Examples

```ruby
client = Sappiamo.client(endpoint: 'https://your-sappiamo-endpoint.com/api/v1, access_token: 'your-api-token)
client.titles.all   # list out all titles in the sappiamo database
```

### Creating an order

```ruby
order = Sappiamo::Order.new(cRAnrede: "Herr", cRVorname: "Test", cRName: "User", cRAdresse: "TestAdress", cRPLZ: "4053", cROrt: "Basel", cRLandISO: "CH", cREMail: "test@test.com", line_items_attributes: [{cProdKey: "D075D583-4D5E-4DE6-8D6B-9C7807A07DDD", cAuflKey: "E9B80D78-6E5E-4890-90C9-3FBA4C949F36", nBestellMnge: 2, nVerPreis: 49.0}, {cProdKey: "0819F486-2B8B-4F65-A181-1CD78A060278", cAuflKey: "C8A275FC-E949-40E8-850D-A8665EB7D557", nBestellMnge: 1, nVerPreis: 12.0}])
```

## How to Contribute

If you find what looks like a bug:

1. Check the GitHub issue tracker to see if anyone else has had the same issue.
https://github.com/codegestalt/sappiamo/issues
2. If you don’t see anything, create an issue with information on how to reproduce it.

If you want to contribute an enhancement or a fix:

1. Fork the project on github https://github.com/codegestalt/sappiamo
2. Make your changes with tests
3. Commit the changes without messing with the Rakefile, or Version
4. Make an entry to HISTORY.md
5. Send me a pull request
