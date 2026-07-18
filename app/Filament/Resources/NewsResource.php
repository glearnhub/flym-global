<?php

namespace App\Filament\Resources;

use App\Filament\Resources\NewsResource\Pages;
use App\Models\News;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class NewsResource extends Resource
{
    protected static ?string $model = News::class;

    protected static ?string $navigationIcon = 'heroicon-o-newspaper';

    protected static ?string $navigationGroup = 'Organization';

    protected static bool $isScopedToTenant = false;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('department_id')
                    ->relationship('department', 'name')
                    ->label('Department (leave blank for org-wide news)')
                    ->default(null),
                Forms\Components\TextInput::make('title')
                    ->required()
                    ->maxLength(255),
                Forms\Components\Textarea::make('body')
                    ->required()
                    ->columnSpanFull(),
                Forms\Components\FileUpload::make('photo')
                    ->image()
                    ->directory('news')
                    ->default(null),
                Forms\Components\DateTimePicker::make('published_at')
                    ->default(now()),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->defaultSort('published_at', 'desc')
            ->columns([
                Tables\Columns\ImageColumn::make('photo'),
                Tables\Columns\TextColumn::make('title')
                    ->searchable(),
                Tables\Columns\TextColumn::make('department.name')
                    ->placeholder('Org-wide')
                    ->sortable(),
                Tables\Columns\TextColumn::make('published_at')
                    ->dateTime()
                    ->sortable(),
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
            'index' => Pages\ListNews::route('/'),
            'create' => Pages\CreateNews::route('/create'),
            'edit' => Pages\EditNews::route('/{record}/edit'),
        ];
    }
}
