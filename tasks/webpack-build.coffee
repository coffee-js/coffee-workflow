
path = require('path')
webpack = require('webpack')
webpackDev = require('./webpack-dev')
ExtractTextPlugin = require('extract-text-webpack-plugin')

module.exports = (info) ->
  webpackConfig = webpackDev(info)
  # returns
  stats: false
  entry:
    main: [ './src/main' ]
    vendor: ['react']
  output:
    path: path.join(info.__dirname, 'build/')
    filename: '[name].[chunkhash:8].js'
  performance:
    hints: 'warning'
  resolve: webpackConfig.resolve
  module:
    rules: [
      {test: /\.coffee$/, loader: 'coffee-loader', exclude: /node_modules/}
      {test: /.(png|jpg)$/, loader: 'url-loader', query: limit: 100}
      {test: /\.css$/, loader: ExtractTextPlugin.extract({
        fallback: 'style-loader', use: 'css-loader!postcss-loader'
      })}
    ]
  plugins: [
    new webpack.DefinePlugin
      'process.env':
        NODE_ENV: JSON.stringify('production')
    new webpack.optimize.CommonsChunkPlugin({name: 'vendor', filename: 'vendor.[chunkhash:8].js'})
    new ExtractTextPlugin('style.[chunkhash:8].css')
    new webpack.optimize.UglifyJsPlugin(sourceMap: false)
  ]
