Building for Plugins with React & Flux
----

----

**Check out [https://github.com/nylas/component-store-example](https://github.com/nylas/component-store-example) for the latest version of this code and dicussion!**

----


This sample code demonstrates the three concepts we covered in our talk in a small app that implements a message list.

1. Using a single, central DataStore to eliminate store interdependencies and allow plugins to modify data in unexpected ways.

2. Using a ComponentStore to dynamically register and inject components at runtime.

3. Isolating the React.Render calls for third-party "unsafe" components.

#### Getting Started

To run the sample project, run the commands below and visit [http://localhost:9001](http://localhost:9001) in your browser.

```
npm install
grunt connect
```

#### Get in touch!

We'd love your thoughts and feedback. Feel free to email us at `ben@nylas.com` and `evan@nylas.com`. If you think React and Flux are great, we're also [hiring](http://nylas.com/jobs)!