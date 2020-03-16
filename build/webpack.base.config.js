const path = require('path')
const postcssconfig = require('../postcss.config.js')
const vueConfig = require('./vue-loader.config')
const ExtractTextPlugin = require('extract-text-webpack-plugin')
const FriendlyErrorsPlugin = require('friendly-errors-webpack-plugin')
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin
const ParallelUglifyPlugin = require('webpack-parallel-uglify-plugin')
const HappyPack = require('happypack')
const HardSourcePlugin = require('hard-source-webpack-plugin')
const SpeedMeasurePlugin = require('speed-measure-webpack-plugin')
const smp = new SpeedMeasurePlugin()

const isProd = process.env.NODE_ENV === 'production'

const config = {
  devtool: isProd
    ? false
    : '#cheap-module-source-map',
  output: {
    path: path.resolve(__dirname, '../dist'),
    publicPath: '/dist/',
    filename: '[name].[chunkhash].js'
  },
  resolve: {
    modules: [
      path.resolve(__dirname, '../node_modules')
    ],
    alias: {
      'public': path.resolve(__dirname, '../public'),
      'page': path.resolve(__dirname, '../src/view')
    }
  },
  module: {
    noParse: /es6-promise\.js$/, // avoid webpack shimming process
    rules: [
      {
        test: /\.vue$/,
        loader: 'vue-loader',
        options: vueConfig
      },
      {
        test: /\.js$/,
        loader: isProd ? 'happypack/loader?id=happyBabel':'babel-loader',
        include: [
          path.resolve(__dirname, '../src'), 
          path.resolve(__dirname, '../server')
        ],
        exclude: /node_modules/
      },
      {
        test: /\.(png|jpg|gif|svg)$/,
        loader: 'url-loader',
        options: {
          limit: 10000,
          name: '[name].[ext]?[hash]'
        },
      },
      {
        test: /\.css$/,
        use: isProd
          ? ExtractTextPlugin.extract({
              use: 'css-loader?minimize',
              fallback: 'vue-style-loader'
            })
          : ['vue-style-loader', 'css-loader'],
        include: [
          path.resolve(__dirname, '../src'), 
          path.resolve(__dirname, '../node_modules/view-design'),
          path.resolve(__dirname, '../node_modules/github-markdown-css')
        ]
      },
      {
        test: /\.(woff2?|eot|ttf|otf)(\?.*)?$/,
        loader: 'url-loader',
        options: {
          limit: 10000,
          name: 'fonts/[name].[hash:7].[ext]'
        },
        include: [
          path.resolve(__dirname, '../node_modules/view-design'),
          path.resolve(__dirname, '../node_modules/github-markdown-css')
        ]
      }
    ]
  },
  performance: {
    maxEntrypointSize: 300000,
    hints: isProd ? 'warning' : false
  },
  plugins: isProd
    ? [
        new ParallelUglifyPlugin({
          parallel: true, // 开启并行压缩 默认线程=cup-1
          uglifyOptions: {
            output: {
              beautify: false,
              comments: false
            },
            compress: {
              drop_debugger: true,
              drop_console: true
            },
            warnings: false
          }
        }),
        new ExtractTextPlugin({
          filename: 'common.[chunkhash].css'
        }),
        new HappyPack({
          id: 'happyBabel',
          loaders: [
            {
              loader: 'babel-loader',
              options: {
                cacheDirectory: true
              }
            }
          ]
        }),
        new BundleAnalyzerPlugin(),
        new HardSourcePlugin()
      ]
    : [
        new FriendlyErrorsPlugin()
      ]
}

module.exports = smp.wrap(config)