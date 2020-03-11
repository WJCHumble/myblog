const path = require('path')
const os = require('os')
const webpack = require('webpack')
const vueConfig = require('./vue-loader.config')
const ExtractTextPlugin = require('extract-text-webpack-plugin')
const FriendlyErrorsPlugin = require('friendly-errors-webpack-plugin')
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin
const ParallelUglifyPlugin = require('webpack-parallel-uglify-plugin')
const HappyPack = require('happypack')
const happyThreadPool = HappyPack.ThreadPool({ size: os.cpus().length })

const isProd = process.env.NODE_ENV === 'production'

module.exports = {
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
        include: [path.resolve(__dirname, '../src'), path.resolve(__dirname, '../server')],
        exclude: /node_modules/
      },
      {
        test: /\.(png|jpg|gif|svg)$/,
        loader: 'url-loader',
        options: {
          limit: 10000,
          name: '[name].[ext]?[hash]'
        }
      },
      {
        test: /\.css$/,
        use: isProd
          ? ExtractTextPlugin.extract({
              use: 'css-loader?minimize',
              fallback: 'vue-style-loader'
            })
          : ['vue-style-loader', 'css-loader'],
      },
      {
        test: /\.(woff2?|eot|ttf|otf)(\?.*)?$/,
        loader: 'url-loader',
        options: {
          limit: 10000,
          name: 'fonts/[name].[hash:7].[ext]'
        }
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
          cacheDir: path.resolve(__dirname, 'node_modules'),
          uglifyOptions: {
            output: {
              comments: false
            },
            compress: {
              drop_debugger: true,
              drop_console: true
            },
            warnings: false
          }
        }),
        new webpack.optimize.ModuleConcatenationPlugin(),
        new ExtractTextPlugin({
          filename: 'common.[chunkhash].css'
        }),
        new BundleAnalyzerPlugin(),
        new HappyPack({
          id: 'happyBabel',
          loaders: [{
            loader: 'babel-loader?cacheDirectory=true'
          }],
          threadPool: happyThreadPool,
          verbose: true // 允许 HappyPack 输出日志
        })
      ]
    : [
        new FriendlyErrorsPlugin()
      ]
}
