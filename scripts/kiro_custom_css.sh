#!/bin/bash

FILE="/usr/share/kiro/resources/app/out/vs/workbench/workbench.desktop.main.css"

# CSS block to append
read -r -d '' CSS_BLOCK <<'EOF'
.monaco-workbench,
.monaco-workbench .monaco-menu,
.monaco-workbench .sidebar,
.monaco-workbench .editor-group-container,
.monaco-workbench .statusbar,
.monaco-workbench .tabs-container,
.monaco-workbench .breadcrumb-item,
.monaco-workbench .notifications-list-container,
.monaco-workbench .quick-input-widget,
.monaco-workbench .suggest-widget,
.monaco-workbench .monaco-inputbox,
.monaco-workbench .monaco-list,
.monaco-workbench .monaco-select-box,
.monaco-workbench .monaco-dialog,
.monaco-workbench .monaco-hover,
.monaco-workbench .monaco-toolbar,
.monaco-workbench .monaco-action-bar .action-label:not(.codicon),
.monaco-workbench .monaco-custom-toggle .monaco-custom-toggle-label,
.monaco-workbench .monaco-button,
.monaco-workbench .monaco-dropdown,
.monaco-workbench .monaco-checkbox .label,
.monaco-workbench .monaco-radio .label,

.monaco-workbench .monaco-text-button,
.monaco-workbench .monaco-text-button > span,
.monaco-workbench .monaco-icon-label > .monaco-icon-label-container > .monaco-icon-name-container > .monaco-highlighted-label,
.monaco-workbench .monaco-menu .action-label:not(.codicon),
.monaco-workbench .monaco-menu .keybinding,
.monaco-workbench .monaco-list-rows .monaco-list-row .label-name,
.monaco-workbench .monaco-list-rows .monaco-list-row .label-description,
.monaco-workbench .monaco-dialog .dialog-message,
.monaco-workbench .monaco-dialog .dialog-title,
.monaco-workbench .monaco-hover .hover-row .label,
.monaco-workbench .monaco-inputbox input,
.monaco-workbench .monaco-select-box-dropdown-list .monaco-list-row .label,
.monaco-workbench .monaco-tree .monaco-tree-row .label,
.monaco-workbench .debug-toolbar .action-label,
.monaco-workbench .composite.title,
.monaco-workbench .pane-header .title {
    font-family: 'JetBrainsMono Nerd Font', system-ui, -apple-system, sans-serif !important;
}
.active-item-indicator{
    background-color: transparent !important;
}
.monaco-workbench *:not(.codicon):not([class*="codicon-"]):not(.icon) {
    font-family: 'JetBrainsMono Nerd Font', system-ui, -apple-system, sans-serif !important;
}
EOF

# Check if the font exists
if ! grep -qF "JetBrainsMono Nerd Font" "$FILE"; then
    # Append with sudo if needed
    if [ ! -w "$FILE" ]; then
        echo "Need sudo to modify $FILE"
        sudo bash -c "echo '' >> '$FILE' && echo \"$CSS_BLOCK\" >> '$FILE'"
        echo "CSS block appended with sudo."
    else
        echo "" >> "$FILE"
        echo "$CSS_BLOCK" >> "$FILE"
        echo "CSS block appended."
    fi
else
    echo "Font already exists. Nothing done."
fi

