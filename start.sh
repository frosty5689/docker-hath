#!/usr/bin/expect

if { ! [info exists env(HATH_CLIENT_ID)] } {
    puts "Missing H@H Client ID"
    exit 1
}

if { ! [info exists env(HATH_CLIENT_KEY)] } {
    puts "Missing H@H Client Key"
    exit 1
}

set timeout 2s

spawn java -jar /opt/hath/HentaiAtHome.jar  \
    --cache-dir=/data/hath/cache            \
    --data-dir=/data/hath/data              \
    --download-dir=/data/hath/download      \
    --log-dir=/data/hath/log

expect {
    "Enter Client ID*" {
        send "$env(HATH_CLIENT_ID)\n"
        send_user "\n"
    }
}

expect {
    "Invalid Client ID*" {
        exit 1
    }
}

expect {
    "Enter Client Key*" {
        send "$env(HATH_CLIENT_KEY)\n"
        send_user "\n"
    }
}

expect {
    "Invalid Client Key*" {
        exit 1
    }
}

expect {
    "Startup Failure*" {
        exit 1
    }
}

interact
