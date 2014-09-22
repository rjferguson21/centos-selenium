#!/bin/env bash

JAVA_CMD="java -jar"
LOG_FILE="{{ selenium_logs }}/selenium.log"
ERROR_LOG="{{ selenium_logs }}/error.log"
REDIRECT="1>>${LOG_FILE} 2>>${ERROR_LOG} &"

CHROMEDRIVER="{% if with_chromedriver %}-Dwebdriver.chrome.driver={{ selenium_dir }}/chromedriver-{{ chromedriver_version }} -Dwebdriver.chrome.logfile={{selenium_logs}}/chromedriver.log{% endif %}"
PHANTOMJS="{% if with_phantomjs %}-Dphantomjs.binary.path={{ selenium_dir }}/phantomjs-{{ phantomjs_version }} -Dphantomjs.cli.args=\"--webdriver-logfile={{selenium_logs}}/phantomjs.log\"{% endif %}"
EXEC="${JAVA_CMD}"
EXEC_REDIRECT="${JAVA_CMD} {{ selenium_dir }}/selenium-server-standalone-{{ selenium_version }}.jar ${CHROMEDRIVER} ${PHANTOMJS} ${REDIRECT}"

# make sure log directory is created
mkdir -p {{ selenium_logs }}

$EXEC_REDIRECT
