package com.example.flutter_app

import android.content.Context
import android.util.Log
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class TeadsViewFactory(private val messenger: BinaryMessenger)
    : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    
    override fun create(context: Context,
                        id: Int,
                        args: Any?): PlatformView {

        Log.d("HelloFlutter", "$args")
        return TeadsViewContainer(context.applicationContext, messenger, id, args)
    }
}