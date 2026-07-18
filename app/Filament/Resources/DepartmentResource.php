<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DepartmentResource\Pages;
use App\Models\Department;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Support\Str;

class DepartmentResource extends Resource
{
    protected static ?string $model = Department::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationGroup = 'Organization';

    protected static bool $isScopedToTenant = false;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('code')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255)
                    ->live(onBlur: true)
                    ->afterStateUpdated(fn (string $state, callable $set) => $set('slug', Str::slug($state))),
                Forms\Components\TextInput::make('slug')
                    ->required()
                    ->maxLength(255)
                    ->unique(ignoreRecord: true),
                Forms\Components\Textarea::make('description')
                    ->columnSpanFull(),
                Forms\Components\DatePicker::make('founded_on'),
                Forms\Components\Toggle::make('is_active')
                    ->default(true)
                    ->required(),
                Forms\Components\TextInput::make('sort_order')
                    ->label('Display order')
                    ->helperText('Lower numbers show first on the public site.')
                    ->required()
                    ->numeric()
                    ->default(0),
                Forms\Components\ColorPicker::make('theme_color')
                    ->label('Page background color')
                    ->helperText('Overrides the site navy navbar/footer background on this department\'s pages. Leave blank to use the default theme.'),
                Forms\Components\ColorPicker::make('accent_color')
                    ->label('Menu highlight color')
                    ->helperText('Used for the active/hovered menu text on this department\'s pages. Leave blank to use gold.'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->defaultSort('sort_order')
            ->reorderable('sort_order')
            ->columns([
                Tables\Columns\TextColumn::make('code')
                    ->searchable(),
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('founded_on')
                    ->date()
                    ->sortable(),
                Tables\Columns\IconColumn::make('is_active')
                    ->boolean(),
                Tables\Columns\ColorColumn::make('theme_color'),
                Tables\Columns\ColorColumn::make('accent_color'),
                Tables\Columns\TextColumn::make('leaders_count')
                    ->counts('leaders')
                    ->label('Leaders'),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListDepartments::route('/'),
            'create' => Pages\CreateDepartment::route('/create'),
            'edit' => Pages\EditDepartment::route('/{record}/edit'),
        ];
    }
}
