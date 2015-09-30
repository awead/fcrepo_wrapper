# FcrepoWrapper

Wrap any task with a Solr instance:

```ruby
FcrepoWrapper.wrap do |solr|
  # Something that requires Solr
end
```

Or with Solr and a solr collection:

```ruby
  subject.wrap do |solr|
    solr.with_collection(dir: File.join(FIXTURES_DIR, "basic_configs")) do |collection_name|
    end
  end
```

## Basic Options

```ruby
FcrepoWrapper.wrap port: 8983, verbose: true, managed: true 
```

```ruby
solr.with_collection(name: 'collection_name', dir: 'path_to_solr_confiigs')
```