var webpack = require('webpack');
var ExtractTextPlugin = require("extract-text-webpack-plugin");
var path = require('path');

module.exports = {

    entry: {
        script: './themes/main/js/script.js',
        app: './themes/main/app.js',
        vendor: ['vue','axios','toastr','jquery','lethargy','wolfy87-eventemitter','smartscroll']
    },

    output: {
        path: path.resolve(__dirname, 'themes/main/assets'),
        filename: '[name].js',
        publicPath: 'themes/main/assets'
    },

    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node-modules/,
                use: 'babel-loader'
            },
            {
                test: /\.vue$/,
                exclude: /node-modules/,
                use: 'vue-loader'
            },
            {
                test: /\.(css|sass|scss)$/,
                use: ExtractTextPlugin.extract({
                    fallback: 'style-loader',
                    use: [
                            {
                                loader: 'css-loader',
                                options: {
                                    sourceMap: true,
                                    minimize: {
                                        discardComments: {
                                            removeAll: true
                                        }
                                    }
                                }
                            },
                            {
                                loader: 'postcss-loader'
                            },
                            {
                                loader: 'sass-loader'   
                            }
                    ],
                    publicPath: 'themes/main/assets'
                })
            }
        ],
    },

    resolve: {
        alias: {
            'vue$': 'vue/dist/vue.common.js',
            'TweenLite': 'gsap/TweenLite',
            'TimelineLite': 'gsap/TimelineLite',
            'CSSPlugin': 'gsap/CSSPlugin',
        }
    },

    plugins: [
        new webpack.optimize.CommonsChunkPlugin({
            names: ['vendor']
        }),
        new ExtractTextPlugin({
            filename: '[name].css',
            disable: false,
            allChunks: true
        }),  
        new webpack.ProvidePlugin({
          $: 'jquery',
          jQuery: 'jquery'
        })       
    ],
};

if(process.env.NODE_ENV === 'production') {
    module.exports.plugins = module.exports.plugins.concat([
        new webpack.DefinePlugin({
            'process.env': {
                NODE_ENV: '"production"'
            }
        }),

        new webpack.optimize.UglifyJsPlugin({
            sourceMap: true,
            compress: {
                warnings: false
            }
        }),       
    ]);
}