allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

// Ensure Android library/application subprojects generate BuildConfig so plugins
// that add custom BuildConfig fields (e.g. firebase_auth) don't fail during config.
subprojects {
    plugins.withId("com.android.library") {
        (extensions.findByName("android") as? com.android.build.gradle.LibraryExtension)?.run {
            buildFeatures.run {
                buildConfig = true
            }
        }
    }
    plugins.withId("com.android.application") {
        (extensions.findByName("android") as? com.android.build.gradle.AppExtension)?.run {
            buildFeatures.run {
                buildConfig = true
            }
        }
    }
}
