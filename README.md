# AC Hub

### Ruby version

```
6.0.2.2
```

### Ruby version

```
2.6.5
```

### Setup

```
bundle
```

### Database creation

```
rake db:create
```

### Database seeds (fake data)

```
rake db:seed
```

### Test suite

```
rspec
```

### Generate API docs

```
rake rswag:specs:swaggerize PATTERN="api/**/*_spec.rb"
```

### Deployment setup

```
git remote add heroku git@github.com:alkema/ac-devices.git
```

### Deployment

```
git push heroku  master
```
