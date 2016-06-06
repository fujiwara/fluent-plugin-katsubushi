# Fluent::Plugin::Katsubushi

A [Fluentd](http://fluentd.org) filter plugin to inject an id getting from [katsubushi](https://github.com/kayac/go-katsubushi).

## Usage

```
<filter>
  @type katsubushi
  id_key id
  integer true
  host localhost
  port 11212
</filter>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fujiwara/fluent-plugin-katsubushi.


## License

Apache License, Version 2.0
