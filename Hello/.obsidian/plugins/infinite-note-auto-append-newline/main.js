const obsidian = require('obsidian');

const DEFAULT_SETTINGS = {
	linesToAppend: 1
};

class InfiniteNotePlugin extends obsidian.Plugin {
	async onload() {
		await this.loadSettings();
		this.isModifying = false;

		this.addSettingTab(new InfiniteNoteSettingTab(this.app, this));

		this.registerEvent(
			this.app.workspace.on('editor-change', (editor, info) => this.checkAndAppend(editor))
		);

		this.registerEvent(
			this.app.workspace.on('file-open', () => {
				const view = this.app.workspace.getActiveViewOfType(obsidian.MarkdownView);
				if (view && view.editor) {
					this.checkAndAppend(view.editor);
				}
			})
		);

		// Check the currently active view when the plugin loads
		this.app.workspace.onLayoutReady(() => {
			const view = this.app.workspace.getActiveViewOfType(obsidian.MarkdownView);
			if (view && view.editor) {
				this.checkAndAppend(view.editor);
			}
		});

		// Listen to cursor movement
		this.registerDomEvent(document, 'selectionchange', () => {
			const view = this.app.workspace.getActiveViewOfType(obsidian.MarkdownView);
			if (view && view.editor) {
				this.checkAndAppend(view.editor);
			}
		});
	}

	checkAndAppend(editor) {
		if (this.isModifying) return;

		const doc = editor.getDoc();
		const lineCount = doc.lineCount();
		const lastLine = lineCount - 1;
		
		let emptyLinesAtEnd = 0;
		for (let i = lastLine; i >= 0; i--) {
			if (doc.getLine(i) === '') {
				emptyLinesAtEnd++;
			} else {
				break;
			}
		}

		const selections = editor.listSelections();
		let maxCursorLine = 0;
		for (const sel of selections) {
			maxCursorLine = Math.max(maxCursorLine, sel.head.line, sel.anchor.line);
		}

		const linesBelowCursor = lastLine - maxCursorLine;
		
		const deficitFromEmptyLines = Math.max(0, this.settings.linesToAppend - emptyLinesAtEnd);
		const deficitFromCursor = Math.max(0, this.settings.linesToAppend - linesBelowCursor);
		
		const linesToAdd = Math.max(deficitFromEmptyLines, deficitFromCursor);

		if (linesToAdd > 0) {
			const newlines = '\n'.repeat(linesToAdd);
			
			this.isModifying = true;
			
			const lastLineLength = doc.getLine(lastLine).length;
			
			editor.replaceRange(newlines, { line: lastLine, ch: lastLineLength });
			
			editor.setSelections(selections);
			
			this.isModifying = false;
		}
	}

	onunload() {
	}

	async loadSettings() {
		this.settings = Object.assign({}, DEFAULT_SETTINGS, await this.loadData());
	}

	async saveSettings() {
		await this.saveData(this.settings);
	}
}

class InfiniteNoteSettingTab extends obsidian.PluginSettingTab {
	constructor(app, plugin) {
		super(app, plugin);
		this.plugin = plugin;
	}

	display() {
		const {containerEl} = this;
		containerEl.empty();

		new obsidian.Setting(containerEl)
			.setName('Lines to append')
			.setDesc('Number of empty lines to automatically maintain at the end of the document.')
			.addText(text => text
				.setPlaceholder('Enter a number')
				.setValue(this.plugin.settings.linesToAppend.toString())
				.onChange(async (value) => {
					const parsed = parseInt(value);
					if (!isNaN(parsed) && parsed >= 0) {
						this.plugin.settings.linesToAppend = parsed;
						await this.plugin.saveSettings();
					}
				}));
	}
}

module.exports = InfiniteNotePlugin;

/* nosourcemap */