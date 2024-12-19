//
//  MockFiles.swift
//  MegamilAppAdmin
//
//  Created by Eduardo dos santos on 03/09/21.
//

import Foundation

extension MockFilesKotlin {

    func getMockMapperResponseToModel(name: String) -> String {
        return replace(text: self.mockMapperResponseToModel, name: name)
    }
    
    func getMockMapperRequestToModel(name: String) -> String {
        return replace(text: self.mockMapperRequestToModel, name: name)
    }
    
    func getMockRequest(name: String) -> String {
        return replace(text: self.mockRequest, name: name)
    }
    
    func getMockResponse(name: String) -> String {
        return replace(text: self.mockResponse, name: name)
    }
    
    func getMockEndPoints(name: String) -> String {
        return replace(text: self.mockEndPoints, name: name)
    }
    
    func getMockRepositoryImpl(name: String) -> String {
        return replace(text: self.MockRepositoryImpl, name: name)
    }
    
    func getMockModel(name: String) -> String {
        return replace(text: self.mockModel, name: name)
    }
    
    func getMockRepository(name: String) -> String {
        return replace(text: self.mockRepository, name: name)
    }
    
    func getMockUseCase(name: String) -> String {
        return replace(text: self.mockUseCase, name: name)
    }
    
    func getMockActivity(name: String) -> String {
        return replace(text: self.mockActivity, name: name)
    }
    
    func getMockViewModel(name: String) -> String {
        return replace(text: self.mockViewModel, name: name)
    }
    
    func getMockExt(name: String) -> String {
        return replace(text: self.mockExt, name: name)
    }
    
    func getMockDI(name: String) -> String {
        return replace(text: self.mockDI, name: name)
    }
    
    func getMockXML(name: String) -> String {
        return replace(text: self.mockXML, name: name)
    }
    
    func replace(text: String,name: String) -> String {
        var text = text
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: date)
        
        text = text.replacingOccurrences(of: companyKey, with: "movida") //@todo
        text = text.replacingOccurrences(of: nameKey, with: NSFullUserName())
        text = text.replacingOccurrences(of: dateKey, with: dateString)
        text = text.replacingOccurrences(of: yearKey, with: yearString)
        text = text.replacingOccurrences(of: passKeyUc, with: name.prefix(1).capitalized + name.dropFirst())
        return text.replacingOccurrences(of: passKeyLc, with: name.prefix(1).lowercased() + name.dropFirst())
    }
    
}

class MockFilesKotlin {
    
    let passKeyUc = "ModuleKotlin"
    let passKeyLc = "moduleKotlin"
    let nameKey = "_NAME_"
    let dateKey = "_DATE_"
    let yearKey = "_YEAR_"
    let companyKey = "_COMPANY_"
    
    let mockMapperResponseToModel =
"""
// ----------------------------------------------------------------------------
// File: ModuleKotlinResponseToModel.kt
// Created by _NAME_ on _DATE_.
// Copyright © _YEAR_ _NAME_. All rights reserved.
//
// Description:
//
// ----------------------------------------------------------------------------

package com._COMPANY_.moduleKotlins.data.mappers

import com._COMPANY_.moduleKotlins.data.responses.ModuleKotlinsResponse
import com._COMPANY_.moduleKotlins.domain.models.ModuleKotlin

internal class ModuleKotlinsDataToModel {

    suspend fun map(data: ModuleKotlinsResponse) =

        ModuleKotlin(
            success = data.success,
            msg = data.msg
        )

}
"""
    
    let mockMapperRequestToModel =
"""
// ----------------------------------------------------------------------------
// File: ModuleKotlinRequestToModel.kt
// Created by _NAME_ on _DATE_.
// Copyright © _YEAR_ _NAME_. All rights reserved.
//
// Description:
//
// ----------------------------------------------------------------------------

package com._COMPANY_.moduleKotlins.data.mappers

class ModuleKotlinsRequestToModel {

}

"""
    
    let mockRequest =
"""
// ----------------------------------------------------------------------------
// File: ModuleKotlinRequest.kt
// Created by _NAME_ on _DATE_.
// Copyright © _YEAR_ _NAME_. All rights reserved.
//
// Description:
//
// ----------------------------------------------------------------------------

package com._COMPANY_.moduleKotlins.data.requests

import com.google.gson.annotations.SerializedName
import io.michaelrocks.paranoid.Obfuscate
import java.util.*

@Obfuscate
data class ModuleKotlinsRequest(
    @field:SerializedName("Sample") var sample: String? = null
)

"""
    
    let mockResponse =
"""
// ----------------------------------------------------------------------------
// File: ModuleKotlinResponse.kt
// Created by _NAME_ on _DATE_.
// Copyright © _YEAR_ _NAME_. All rights reserved.
//
// Description:
//
// ----------------------------------------------------------------------------

package com._COMPANY_.moduleKotlins.data.responses

import com.google.gson.annotations.SerializedName
import io.michaelrocks.paranoid.Obfuscate

@Obfuscate
class ModuleKotlinsResponse(
    @field:SerializedName("success") var success: Boolean,
    @field:SerializedName("msg") var msg: String,
)

"""
    
    let mockEndPoints =
"""
// ----------------------------------------------------------------------------
// File: ModuleKotlinEndPoints.kt
// Created by _NAME_ on _DATE_.
// Copyright © _YEAR_ _NAME_. All rights reserved.
//
// Description:
//
// ----------------------------------------------------------------------------

package com._COMPANY_.moduleKotlins.data

import com._COMPANY_.moduleKotlins.data.requests.ModuleKotlinsRequest
import com._COMPANY_.moduleKotlins.data.responses.ModuleKotlinsResponse
import io.michaelrocks.paranoid.Obfuscate
import retrofit2.Response
import retrofit2.http.*

@Obfuscate
interface ModuleKotlinsEndPoints {

    @GET("path/endPoint")
    suspend fun getModuleKotlins(@Body request: ModuleKotlinsRequest): Response<ModuleKotlinsResponse>

}

"""
    
    let MockRepositoryImpl =
"""
// ----------------------------------------------------------------------------
// File: ModuleKotlinRepositoryImpl.kt
// Created by _NAME_ on _DATE_.
// Copyright © _YEAR_ _NAME_. All rights reserved.
//
// Description:
//
// ----------------------------------------------------------------------------

package com._COMPANY_.moduleKotlins.data

import android.content.Context
import com._COMPANY_.commons.repository.base.connection.extentions.coroutines.Status
import com._COMPANY_.commons.repository.base.connection.extentions.coroutines.connectIn
import com._COMPANY_.commons.repository.domain.mapperToDomain
import com._COMPANY_.commons.repository.domain.mapperToErrorDomain
import com._COMPANY_.moduleKotlins.data.mappers.ModuleKotlinsDataToModel
import com._COMPANY_.moduleKotlins.data.requests.ModuleKotlinsRequest
import com._COMPANY_.moduleKotlins.domain.models.ModuleKotlin
import com._COMPANY_.moduleKotlins.domain.repositories.ModuleKotlinsRepository

internal class ModuleKotlinsRepositoryImpl(private val context: Context, private val service: ModuleKotlinsEndPoints) :
    ModuleKotlinsRepository {

    override suspend fun getModuleKotlin(body: ModuleKotlinsRequest): Result<ModuleKotlin> {

        val response = service.connectIn {
            getModuleKotlins(body)
        }

        return when (response.status) {

            Status.SUCCESS -> {
                if(response.data?.success == true)
                    return response.data.mapperToDomain { ModuleKotlinsDataToModel().map(this) }
                else
                    return response.data?.msg.mapperToErrorDomain()
            }

            Status.ERROR -> response.message.mapperToErrorDomain()

        }

    }

}

"""
    
    let mockModel =
"""
// ----------------------------------------------------------------------------
// File: ModuleKotlinModel.kt
// Created by _NAME_ on _DATE_.
// Copyright © _YEAR_ _NAME_. All rights reserved.
//
// Description:
//
// ----------------------------------------------------------------------------

package com._COMPANY_.moduleKotlins.domain.models

internal data class ModuleKotlin(
    val success: Boolean = false,
    val msg: String = "",
)

"""
    
    let mockRepository =
"""
// ----------------------------------------------------------------------------
// File: ModuleKotlinRepository.kt
// Created by _NAME_ on _DATE_.
// Copyright © _YEAR_ _NAME_. All rights reserved.
//
// Description:
//
// ----------------------------------------------------------------------------

package com._COMPANY_.moduleKotlins.domain.repositories

import com._COMPANY_.moduleKotlins.data.requests.ModuleKotlinsRequest
import com._COMPANY_.moduleKotlins.domain.models.ModuleKotlin

internal interface ModuleKotlinsRepository {
    suspend fun getModuleKotlin(
        body: ModuleKotlinsRequest
    ): Result<ModuleKotlin>
}

"""
    
    let mockUseCase =
"""
// ----------------------------------------------------------------------------
// File: ModuleKotlinUseCase.kt
// Created by _NAME_ on _DATE_.
// Copyright © _YEAR_ _NAME_. All rights reserved.
//
// Description:
//
// ----------------------------------------------------------------------------

package com._COMPANY_.moduleKotlins.domain.useCases

import com._COMPANY_.moduleKotlins.data.requests.ModuleKotlinsRequest
import com._COMPANY_.moduleKotlins.domain.repositories.ModuleKotlinsRepository

internal class ModuleKotlinsUseCase(private val repository: ModuleKotlinsRepository) {
    suspend fun getModuleKotlin(body: ModuleKotlinsRequest) = repository.getModuleKotlin(body)
}

"""
    
    let mockActivity =
"""
// ----------------------------------------------------------------------------
// File: ModuleKotlinActivity.kt
// Created by _NAME_ on _DATE_.
// Copyright © _YEAR_ _NAME_. All rights reserved.
//
// Description:
//
// ----------------------------------------------------------------------------

package com._COMPANY_.moduleKotlins.ui.moduleKotlin

import android.os.Build
import androidx.annotation.RequiresApi
import com._COMPANY_.commons.toolbox.libs.liveData.extentions.observeNotNull
import com._COMPANY_.commons.view.dialog.dialogError
import com._COMPANY_.commons.view.generics.base.activity.BaseActivity
import com._COMPANY_.contract.databinding.ActivityModuleKotlinBinding
import com._COMPANY_.core.toolbox.extensions.view.setSafeOnClickListener
import io.michaelrocks.paranoid.Obfuscate

@Obfuscate
internal class ModuleKotlinActivity : BaseActivity<ModuleKotlinViewModel, ActivityModuleKotlinBinding>() {

    private lateinit var bind: ActivityModuleKotlinBinding

    @RequiresApi(Build.VERSION_CODES.O)
    override fun view(binding: ActivityModuleKotlinBinding) {
        bind = binding
        //val context = binding.root.context

        //viewModel?.getModuleKotlin()

        bind.btnAction.setSafeOnClickListener {
            print("Ok")
        }

    }

    override fun viewModel(viewModel: ModuleKotlinViewModel): Unit = viewModel.run {

        loading.observeNotNull(this@ModuleKotlinActivity) {
            loading(it)
        }

        throwable.observeNotNull(this@ModuleKotlinActivity) {
            dialogError(it)
        }


    }

}

"""
    
    let mockViewModel =
"""
// ----------------------------------------------------------------------------
// File: ModuleKotlinViewModel.kt
// Created by _NAME_ on _DATE_.
// Copyright © _YEAR_ _NAME_. All rights reserved.
//
// Description:
//
// ----------------------------------------------------------------------------

package com._COMPANY_.moduleKotlins.ui.moduleKotlin

import androidx.appcompat.app.AppCompatActivity
import com._COMPANY_.commons.repository.domain.useCaseCatching
import com._COMPANY_.commons.toolbox.libs.liveData.viewModel.BaseViewModel
import com._COMPANY_.core.coreUi.view.generics.dialog.dialogTabletMessage
import com._COMPANY_.moduleKotlins.data.requests.ModuleKotlinsRequest
import com._COMPANY_.moduleKotlins.domain.useCases.ModuleKotlinsUseCase

internal class ModuleKotlinViewModel(
    private val moduleKotlinsUseCase: ModuleKotlinsUseCase,
) : BaseViewModel() {

    fun getModuleKotlin() {
        coroutineScopeLaunchLoading {
            val request = ModuleKotlinsRequest()

            useCaseCatching {
                moduleKotlinsUseCase.getModuleKotlin(request)
            }.onSuccess {
                print(it.msg)
            }.onFailure {
                it.alertError()
            }
        }
    }

}

"""
    
    let mockExt =
"""
// ----------------------------------------------------------------------------
// File: ModuleKotlinExt.kt
// Created by _NAME_ on _DATE_.
// Copyright © _YEAR_ _NAME_. All rights reserved.
//
// Description:
//
// ----------------------------------------------------------------------------

package com._COMPANY_.moduleKotlins.ui

import android.app.Activity
import com._COMPANY_.moduleKotlins.ui.moduleKotlin.ModuleKotlinActivity
import org.jetbrains.anko.intentFor

fun Activity.openModuleKotlinsModuleKotlin() = startActivity(intentFor<ModuleKotlinActivity>())

"""
    
    let mockDI =
"""
// ----------------------------------------------------------------------------
// File: ModuleKotlinDI.kt
// Created by _NAME_ on _DATE_.
// Copyright © _YEAR_ _NAME_. All rights reserved.
//
// Description:
//
// ----------------------------------------------------------------------------

package com._COMPANY_.moduleKotlins

import com._COMPANY_.core.shared.connection._COMPANY_Api
import com._COMPANY_.moduleKotlins.data.ModuleKotlinsEndPoints
import com._COMPANY_.moduleKotlins.data.ModuleKotlinsRepositoryImpl
import com._COMPANY_.moduleKotlins.domain.repositories.ModuleKotlinsRepository
import com._COMPANY_.moduleKotlins.domain.useCases.ModuleKotlinsUseCase
import com._COMPANY_.moduleKotlins.ui.moduleKotlin.ModuleKotlinViewModel
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

private val appRepositoryModule = module {
    factory<ModuleKotlinsEndPoints> { _COMPANY_Api.create(context = get()) }
    factory<ModuleKotlinsRepository> { ModuleKotlinsRepositoryImpl(context = get(), service = get()) }
}

private val appDomainModule = module {
    factory { ModuleKotlinsUseCase(get()) }
}

private val appViewModelModule = module {
    viewModel { ModuleKotlinViewModel( get() ) }
}

val moduleKotlinsModule = listOf(
    appRepositoryModule,
    appDomainModule,
    appViewModelModule
)


"""
    
    let mockXML =
"""
<?xml version="1.0" encoding="utf-8"?>
<androidx.appcompat.widget.LinearLayoutCompat xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical">

    <com._COMPANY_.core.components.generics.header.ui.HeaderView
        android:id="@+id/header_fragment"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        app:title="title"
        />

    <androidx.constraintlayout.widget.ConstraintLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:background="@color/light_gray_f2"
        android:paddingStart="@dimen/_16sdp"
        android:paddingEnd="@dimen/_16sdp"
        android:paddingBottom="@dimen/_16sdp"
        tools:context="com._COMPANY_.moduleKotlins.ui.ModuleKotlinActivity">


        <com._COMPANY_.core.components.ButtonMyriadSemiBold
            android:id="@+id/btnAction"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Button"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintTop_toTopOf="parent"
            app:layout_constraintBottom_toBottomOf="parent" />
        
    </androidx.constraintlayout.widget.ConstraintLayout>
</androidx.appcompat.widget.LinearLayoutCompat>
"""
    
    
}
